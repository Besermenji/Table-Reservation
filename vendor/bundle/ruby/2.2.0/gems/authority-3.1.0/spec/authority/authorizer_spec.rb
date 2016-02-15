require 'spec_helper'
require 'support/example_classes'

describe Authority::Authorizer do

  let(:model_instance) { ExampleResource.new }
  let(:authorizer)    { model_instance.authorizer }
  let(:user)          { ExampleUser.new }

  it "takes a resource instance in its initializer" do
    expect(authorizer.resource).to eq(model_instance)
  end

  describe "instance methods" do

    it "calls the instance default method if no instance method is defined" do
      expect(authorizer).to receive(:default)
      authorizer.creatable_by?(user)
    end

    context "the instance default method" do

      it "delegates to the class default method" do
        expect(authorizer.class).to receive(:default)
        authorizer.default(:creatable, user)
      end

    end

    Authority.adjectives.each do |adjective|
      method_name = "#{adjective}_by?"

      it "responds to `#{method_name}`" do
        expect(authorizer).to respond_to(method_name)
      end

      describe "#{method_name}" do

        context "when given an options hash" do

          it "delegates `#{method_name}` to the corresponding class method, passing the options" do
            expect(authorizer.class).to receive(method_name).with(user, :under => 'God')
            authorizer.send(method_name, user, :under => 'God')
          end

        end

        context "when not given an options hash" do

          it "delegates `#{method_name}` to the corresponding class method, passing no options" do
            expect(authorizer.class).to receive(method_name).with(user)
            authorizer.send(method_name, user)
          end

        end

      end

    end

  end

  describe "class methods" do

    Authority.adjectives.each do |adjective|
      method_name = "#{adjective}_by?"

      it "responds to `#{method_name}`" do
        expect(Authority::Authorizer).to respond_to(method_name)
      end

      describe "#{method_name}" do

        context "when given an options hash" do

          it "delegates `#{method_name}` to the authorizer's `default` method, passing the options" do
            able = method_name.sub('_by?', '').to_sym
            expect(Authority::Authorizer).to receive(:default).with(able, user, :with => 'gusto')
            Authority::Authorizer.send(method_name, user, :with => 'gusto')
          end

        end

        context "when not given an options hash" do

          it "delegates `#{method_name}` to the authorizer's `default` method, passing no options" do
            able = method_name.sub('_by?', '').to_sym
            expect(Authority::Authorizer).to receive(:default).with(able, user)
            Authority::Authorizer.send(method_name, user)
          end

        end

      end

    end

  end

  describe "the default method" do

    context "when given an options hash" do

      it "returns false" do
        expect(Authority::Authorizer.default(:implodable, user, {:for => "my_object"})).to eq(false)
      end
    end

    context "when not given an options hash" do

      it "returns false" do
        expect(Authority::Authorizer.default(:implodable, user)).to eq(false)
      end

    end

  end

end
