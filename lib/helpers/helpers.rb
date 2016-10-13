require 'sinatra/base'

module Sinatra
  module ViewHelper
    def render_statistics?(analysis)
      analysis[:MethodsLessThanFive] && analysis[:ClassesLessThanHundred] && analysis[:PublicPrivateInterface]
    end
    def render_design(analysis)
      render_poltergeist?(analysis) ||
      render_inheritence?(analysis) ||
      render_global?(analysis) ||
      render_params?(analysis) ||
      render_orgy?(analysis) ||
      render_magic?(analysis)
    end
    def render_poltergeist?(analysis)
      analysis[:LazyPoltergeist][:class]
    end
    def render_inheritence?(analysis)
      analysis[:Inheritence][:parent]
    end
    def render_global?(analysis)
      analysis[:GlobalVariable][:number] > 0
    end
    def render_params?(analysis)
      analysis[:ExcessiveMethodParams].empty?
    end
    def render_orgy?(analysis)
      analysis[:ObjectOrgy].empty?
    end
    def render_magic?(analysis)
      analysis[:MagicNumber]
    end
  end

  helpers ViewHelper
end
