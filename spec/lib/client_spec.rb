require 'spec_helper'

module Contentful
  describe Client do

    let(:options) do
      {
        space_id: 'aeae',
        access_token: 'fefe'
      }
    end
    subject { Contentful::Client.new(options) }

    context 'missing options' do

      describe 'missing space_id' do
        let(:options) { {} }

        it 'throws an error' do
          expect { subject.entries }.to raise_error(Client::SpaceIdError)
        end

      end

      describe 'missing token' do
        let(:options) { { space_id: 'aeae' } }

        it 'throws an error' do
          expect { subject.entries }.to raise_error(Client::AccessTokenError)
        end

      end

    end

    describe '#entries(:options)' do
      let(:expected_uri) { 'https://cdn.contentful.com/spaces/aeae/entries' }

      describe 'fetching all' do
        let(:expected_params) do
          {
            params: {
              access_token: 'fefe'
            }
          }
        end

        it 'calls the entries endpoint' do
          expect(RestClient).to receive(:get).with(expected_uri, expected_params)
          subject.entries
        end

      end

      describe 'fetching with additional params' do
        let(:expected_params) do
          {
            params: {
              access_token: 'fefe',
              content_type: 'abab'
            }
          }
        end

        it 'calls the entries endpoint with additional params' do
          expect(RestClient).to receive(:get).with(expected_uri, expected_params)
          subject.entries(content_type: 'abab')
        end

      end
    end

    describe '#entry(:id)' do
      let(:expected_uri) { 'https://cdn.contentful.com/spaces/aeae/entries/123' }
      let(:expected_params) do
        {
          params: {
            access_token: 'fefe'
          }
        }
      end

      it 'calls the entry endpoint' do
        expect(RestClient).to receive(:get).with(expected_uri, expected_params)
        subject.entry('123')
      end
    end

  end
end
