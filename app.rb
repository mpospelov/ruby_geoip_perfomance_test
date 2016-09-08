require 'rubygems'
require 'bundler/setup'

require 'benchmark/ips'
require 'maxminddb'
require 'geoip2_compat'
require 'hive_geoip2'
require 'maxmind_geoip2'
require 'byebug'

ips = ['74.125.225.224', '24.24.24.24', '88.174.0.1', '77.93.127.33']
dbfile = './database.mmdb'

hive_geoip2 = Hive::GeoIP2.new(dbfile)
maxminddb = MaxMindDB.new(dbfile)
geoip2_compat = GeoIP2Compat.new(dbfile)
MaxmindGeoIP2.file dbfile # default: GeoLite2-City.mmdb
MaxmindGeoIP2.locale 'en' # default: 'ru'

Benchmark.ips do |x|
  x.report 'maxminddb' do
    ips.each do |ip|
      maxminddb.lookup(ip).country.iso_code
    end
  end

  x.report 'geoip2_compat' do
    ips.each do |ip|
      geoip2_compat.lookup(ip)[:country_code]
    end
  end

  x.report 'hive_geoip2' do
    ips.each do |ip|
      hive_geoip2.lookup(ip)['country']['iso_code']
    end
  end

  x.report 'maxmind_geoip2' do
    ips.each do |ip|
      MaxmindGeoIP2.locate(ip)['country_code']
    end
  end
end
