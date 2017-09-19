
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-twitter, 
   lisp_url-rewrite, lisp_cl-oauth, lisp_closer-mop, lisp_anaphora, lisp_drakma, lisp_trivial-http, lisp_cl-json,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_url-rewrite lisp_cl-oauth lisp_closer-mop lisp_anaphora lisp_drakma lisp_trivial-http lisp_cl-json  ];
      inherit stdenv;
      systemName = "cl-twitter";
      
      sourceProject = "${lisp-project_cl-twitter}";
      patches = [];
      lisp_dependencies = "${lisp_url-rewrite} ${lisp_cl-oauth} ${lisp_closer-mop} ${lisp_anaphora} ${lisp_drakma} ${lisp_trivial-http} ${lisp_cl-json}";
      name = "lisp_cl-twitter-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
