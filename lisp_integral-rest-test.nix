
{ buildLispPackage, stdenv, fetchurl, lisp-project_integral-rest, 
   lisp_integral, lisp_integral-rest, lisp_prove, lisp_prove-asdf,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_integral lisp_integral-rest lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "integral-rest-test";
      
      sourceProject = "${lisp-project_integral-rest}";
      patches = [];
      lisp_dependencies = "${lisp_integral} ${lisp_integral-rest} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_integral-rest-test-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
