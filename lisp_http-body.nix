
{ buildLispPackage, stdenv, fetchurl, lisp-project_http-body, 
   lisp_quri, lisp_jonathan, lisp_fast-http,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_quri lisp_jonathan lisp_fast-http  ];
      inherit stdenv;
      systemName = "http-body";
      
      sourceProject = "${lisp-project_http-body}";
      patches = [];
      lisp_dependencies = "${lisp_quri} ${lisp_jonathan} ${lisp_fast-http}";
      name = "lisp_http-body-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
