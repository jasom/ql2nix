
{ buildLispPackage, stdenv, fetchurl, lisp-project_clack, 
   lisp_http-body, lisp_dexador, lisp_usocket, lisp_prove, lisp_bordeaux-threads, lisp_lack, lisp_prove-asdf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_http-body lisp_dexador lisp_usocket lisp_prove lisp_bordeaux-threads lisp_lack lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "t-clack-handler-wookie";
      
      sourceProject = "${lisp-project_clack}";
      patches = [];
      lisp_dependencies = "${lisp_http-body} ${lisp_dexador} ${lisp_usocket} ${lisp_prove} ${lisp_bordeaux-threads} ${lisp_lack} ${lisp_prove-asdf}";
      name = "lisp_t-clack-handler-wookie-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }