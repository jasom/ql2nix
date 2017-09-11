
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-download, 
   lisp_drakma,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma  ];
      inherit stdenv;
      systemName = "trivial-download";
      
      sourceProject = "${lisp-project_trivial-download}";
      patches = [];
      lisp_dependencies = "${lisp_drakma}";
      name = "lisp_trivial-download-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
