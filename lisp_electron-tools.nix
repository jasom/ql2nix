
{ buildLispPackage, stdenv, fetchurl, lisp-project_electron-tools, 
   lisp_trivial-exe, lisp_osicat, lisp_trivial-extract, lisp_trivial-download,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-exe lisp_osicat lisp_trivial-extract lisp_trivial-download  ];
      inherit stdenv;
      systemName = "electron-tools";
      
      sourceProject = "${lisp-project_electron-tools}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-exe} ${lisp_osicat} ${lisp_trivial-extract} ${lisp_trivial-download}";
      name = "lisp_electron-tools-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
