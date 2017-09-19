
{ buildLispPackage, stdenv, fetchurl, lisp-project_mcclim, 
   lisp_closer-mop, lisp_trivial-gray-streams, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_trivial-gray-streams lisp_alexandria  ];
      inherit stdenv;
      systemName = "clim-lisp";
      
      sourceProject = "${lisp-project_mcclim}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_trivial-gray-streams} ${lisp_alexandria}";
      name = "lisp_clim-lisp-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
