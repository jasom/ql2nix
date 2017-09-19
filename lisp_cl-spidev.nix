
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-spidev, 
   lisp_trivial-garbage, lisp_documentation-utils,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_documentation-utils  ];
      inherit stdenv;
      systemName = "cl-spidev";
      
      sourceProject = "${lisp-project_cl-spidev}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_documentation-utils}";
      name = "lisp_cl-spidev-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
