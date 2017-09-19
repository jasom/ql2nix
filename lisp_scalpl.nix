
{ buildLispPackage, stdenv, fetchurl, lisp-project_scalpl, 
   lisp_decimals, lisp_dbi, lisp_cl-json, lisp_chanl, lisp_rss, lisp_local-time, lisp_method-combination-utilities, lisp_drakma, lisp_cl-irc, lisp_parse-float, lisp_string-case, lisp_anaphora,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_decimals lisp_dbi lisp_cl-json lisp_chanl lisp_rss lisp_local-time lisp_method-combination-utilities lisp_drakma lisp_cl-irc lisp_parse-float lisp_string-case lisp_anaphora  ];
      inherit stdenv;
      systemName = "scalpl";
      
      sourceProject = "${lisp-project_scalpl}";
      patches = [];
      lisp_dependencies = "${lisp_decimals} ${lisp_dbi} ${lisp_cl-json} ${lisp_chanl} ${lisp_rss} ${lisp_local-time} ${lisp_method-combination-utilities} ${lisp_drakma} ${lisp_cl-irc} ${lisp_parse-float} ${lisp_string-case} ${lisp_anaphora}";
      name = "lisp_scalpl-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
