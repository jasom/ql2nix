
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-twitter, 
   lisp_cl-json, lisp_trivial-http, lisp_drakma, lisp_anaphora, lisp_closer-mop, lisp_cl-oauth, lisp_url-rewrite,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-json lisp_trivial-http lisp_drakma lisp_anaphora lisp_closer-mop lisp_cl-oauth lisp_url-rewrite  ];
      inherit stdenv;
      systemName = "cl-twitter";
      
      sourceProject = "${lisp-project_cl-twitter}";
      patches = [];
      lisp_dependencies = "${lisp_cl-json} ${lisp_trivial-http} ${lisp_drakma} ${lisp_anaphora} ${lisp_closer-mop} ${lisp_cl-oauth} ${lisp_url-rewrite}";
      name = "lisp_cl-twitter-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
