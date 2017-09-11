
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-libyaml, 
   lisp_cl-libyaml, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-libyaml lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-libyaml-test";
      
      sourceProject = "${lisp-project_cl-libyaml}";
      patches = [];
      lisp_dependencies = "${lisp_cl-libyaml} ${lisp_fiveam}";
      name = "lisp_cl-libyaml-test-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
