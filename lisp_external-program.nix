
{ buildLispPackage, stdenv, fetchurl, lisp-project_external-program, 
   lisp_trivial-features,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-features  ];
      inherit stdenv;
      systemName = "external-program";
      
      sourceProject = "${lisp-project_external-program}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-features}";
      name = "lisp_external-program-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
