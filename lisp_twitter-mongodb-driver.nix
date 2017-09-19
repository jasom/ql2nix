
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-twitter, 
   lisp_cl-mongo, lisp_url-rewrite, lisp_cl-oauth, lisp_closer-mop, lisp_anaphora, lisp_drakma, lisp_trivial-http, lisp_cl-json,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-mongo lisp_url-rewrite lisp_cl-oauth lisp_closer-mop lisp_anaphora lisp_drakma lisp_trivial-http lisp_cl-json  ];
      inherit stdenv;
      systemName = "twitter-mongodb-driver";
      
      sourceProject = "${lisp-project_cl-twitter}";
      patches = [];
      lisp_dependencies = "${lisp_cl-mongo} ${lisp_url-rewrite} ${lisp_cl-oauth} ${lisp_closer-mop} ${lisp_anaphora} ${lisp_drakma} ${lisp_trivial-http} ${lisp_cl-json}";
      name = "lisp_twitter-mongodb-driver-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
