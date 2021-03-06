# encoding: utf-8

module Nanoc3::Extra::VCSes

  class Bazaar < Nanoc3::Extra::VCS

    def add(filename)
      system('bzr', 'add', filename)
    end

    def remove(filename)
      system('bzr', 'rm', filename)
    end

    def move(src, dst)
      system('bzr', 'mv', src, dst)
    end

  end

end
