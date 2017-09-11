
{ buildLispPackage, stdenv, fetchurl, lisp-project_yason, 
   lisp_alexandria, lisp_trivial-gray-streams,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_trivial-gray-streams  ];
      inherit stdenv;
      systemName = "yason";
      
      sourceProject = "${lisp-project_yason}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_trivial-gray-streams}";
      name = "lisp_yason-v0.7.6";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
