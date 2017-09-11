
{ buildLispPackage, stdenv, fetchurl, lisp-project_clawk, 
   lisp_regex,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_regex  ];
      inherit stdenv;
      systemName = "clawk";
      
      sourceProject = "${lisp-project_clawk}";
      patches = [];
      lisp_dependencies = "${lisp_regex}";
      name = "lisp_clawk-20111105-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
