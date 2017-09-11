
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-spidev, 
   lisp_documentation-utils, lisp_trivial-garbage,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_documentation-utils lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "cl-spidev";
      
      sourceProject = "${lisp-project_cl-spidev}";
      patches = [];
      lisp_dependencies = "${lisp_documentation-utils} ${lisp_trivial-garbage}";
      name = "lisp_cl-spidev-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
