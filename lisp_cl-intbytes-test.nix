
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-intbytes, 
   lisp_cl-intbytes, lisp_prove, lisp_prove-asdf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-intbytes lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "cl-intbytes-test";
      
      sourceProject = "${lisp-project_cl-intbytes}";
      patches = [];
      lisp_dependencies = "${lisp_cl-intbytes} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_cl-intbytes-test-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
