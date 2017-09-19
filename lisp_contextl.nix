
{ buildLispPackage, stdenv, fetchurl, lisp-project_contextl, 
   lisp_lw-compat, lisp_closer-mop,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lw-compat lisp_closer-mop  ];
      inherit stdenv;
      systemName = "contextl";
      
      sourceProject = "${lisp-project_contextl}";
      patches = [];
      lisp_dependencies = "${lisp_lw-compat} ${lisp_closer-mop}";
      name = "lisp_contextl-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
