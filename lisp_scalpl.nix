
{ buildLispPackage, stdenv, fetchurl, lisp-project_scalpl, 
   lisp_anaphora, lisp_string-case, lisp_parse-float, lisp_cl-irc, lisp_drakma, lisp_method-combination-utilities, lisp_local-time, lisp_rss, lisp_chanl, lisp_cl-json, lisp_dbi, lisp_decimals,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_anaphora lisp_string-case lisp_parse-float lisp_cl-irc lisp_drakma lisp_method-combination-utilities lisp_local-time lisp_rss lisp_chanl lisp_cl-json lisp_dbi lisp_decimals  ];
      inherit stdenv;
      systemName = "scalpl";
      
      sourceProject = "${lisp-project_scalpl}";
      patches = [];
      lisp_dependencies = "${lisp_anaphora} ${lisp_string-case} ${lisp_parse-float} ${lisp_cl-irc} ${lisp_drakma} ${lisp_method-combination-utilities} ${lisp_local-time} ${lisp_rss} ${lisp_chanl} ${lisp_cl-json} ${lisp_dbi} ${lisp_decimals}";
      name = "lisp_scalpl-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
