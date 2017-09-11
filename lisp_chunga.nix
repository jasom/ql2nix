
{ buildLispPackage, stdenv, fetchurl, lisp-project_chunga, 
   lisp_trivial-gray-streams,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-gray-streams  ];
      inherit stdenv;
      systemName = "chunga";
      
      sourceProject = "${lisp-project_chunga}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-gray-streams}";
      name = "lisp_chunga-1.1.6";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
