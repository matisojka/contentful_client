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

    let(:expected_params) do
      {
        params: {
          access_token: 'fefe'
        }
      }
    end

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

    describe '#protocol' do

      describe 'default' do
        let(:options) { {} }

        it 'sets https per default' do
          expect(subject.protocol).to eq('https')
        end
      end

      describe 'http' do
        let(:options) { { protocol: 'http' } }

        it 'sets the protocol to http' do
          expect(subject.protocol).to eq('http')
        end
      end


    end

    describe '#entries(:options)' do
      let(:expected_uri) { 'https://cdn.contentful.com/spaces/aeae/entries' }

      describe 'fetching all' do
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

    describe '#entry(:id, :params)' do
      let(:expected_uri) { 'https://cdn.contentful.com/spaces/aeae/entries/123' }

      it 'calls the entry endpoint' do
        expect(RestClient).to receive(:get).with(expected_uri, expected_params)
        subject.entry('123')
      end

      describe 'with additional params' do
        let(:expected_params) do
          {
            params: {
              access_token: 'fefe',
              include: 1
            }
          }
        end

        it 'calls the entry endpoint' do
          expect(RestClient).to receive(:get).with(expected_uri, expected_params)
          subject.entry('123', include: 1)
        end
      end
    end

    describe 'content_types' do
      let(:expected_uri) { 'https://cdn.contentful.com/spaces/aeae/content_types' }

      describe 'fetching all' do
        it 'calls the content_types endpoint' do
          expect(RestClient).to receive(:get).with(expected_uri, expected_params)
          subject.content_types
        end
      end

      describe 'fetching with additional params' do
        let(:expected_params) do
          {
            params: {
              access_token: 'fefe',
              name: 'Frodo'
            }
          }
        end

        it 'calls the content_types endpoint' do
          expect(RestClient).to receive(:get).with(expected_uri, expected_params)
          subject.content_types(name: 'Frodo')
        end
      end

    end

    describe '#content_type(:id)' do
      let(:expected_uri) { 'https://cdn.contentful.com/spaces/aeae/content_types/123' }

      it 'calls the entry endpoint' do
        expect(RestClient).to receive(:get).with(expected_uri, expected_params)
        subject.content_type('123')
      end

      describe 'with additional params' do
        let(:expected_params) do
          {
            params: {
              access_token: 'fefe',
              include: 1
            }
          }
        end

        it 'calls the entry endpoint' do
          expect(RestClient).to receive(:get).with(expected_uri, expected_params)
          subject.content_type('123', include: 1)
        end
      end
    end

    describe '#asset(:id)' do
      let(:expected_uri) { 'https://cdn.contentful.com/spaces/aeae/assets/123' }

      it 'calls the asset endpoint' do
        expect(RestClient).to receive(:get).with(expected_uri, expected_params)
        subject.asset('123')
      end
    end

  end
end
