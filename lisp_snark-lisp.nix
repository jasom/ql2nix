
{ buildLispPackage, stdenv, fetchurl, lisp-project_snark, 
   lisp_snark-auxiliary-packages,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_snark-auxiliary-packages  ];
      inherit stdenv;
      systemName = "snark-lisp";
      
      sourceProject = "${lisp-project_snark}";
      patches = [];
      lisp_dependencies = "${lisp_snark-auxiliary-packages}";
      name = "lisp_snark-lisp-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
