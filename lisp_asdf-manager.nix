
{ buildLispPackage, stdenv, fetchurl, lisp-project_asdf-manager, 
   lisp_trivial-download, lisp_trivial-extract,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-download lisp_trivial-extract  ];
      inherit stdenv;
      systemName = "asdf-manager";
      
      sourceProject = "${lisp-project_asdf-manager}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-download} ${lisp_trivial-extract}";
      name = "lisp_asdf-manager-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
