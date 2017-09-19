
{ buildLispPackage, stdenv, fetchurl, lisp-project_swank-protocol, 
   lisp_swank, lisp_usocket,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_swank lisp_usocket  ];
      inherit stdenv;
      systemName = "swank-protocol";
      
      sourceProject = "${lisp-project_swank-protocol}";
      patches = [];
      lisp_dependencies = "${lisp_swank} ${lisp_usocket}";
      name = "lisp_swank-protocol-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
