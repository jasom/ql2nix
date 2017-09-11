
{ buildLispPackage, stdenv, fetchurl, lisp-project_http-body, 
   lisp_cl-ppcre, lisp_flexi-streams, lisp_http-body, lisp_prove, lisp_prove-asdf, lisp_trivial-types, lisp_trivial-utf-8,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_flexi-streams lisp_http-body lisp_prove lisp_prove-asdf lisp_trivial-types lisp_trivial-utf-8  ];
      inherit stdenv;
      systemName = "http-body-test";
      
      sourceProject = "${lisp-project_http-body}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_flexi-streams} ${lisp_http-body} ${lisp_prove} ${lisp_prove-asdf} ${lisp_trivial-types} ${lisp_trivial-utf-8}";
      name = "lisp_http-body-test-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
