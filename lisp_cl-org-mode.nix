
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-org-mode, 
   lisp_alexandria, lisp_closer-mop,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_closer-mop  ];
      inherit stdenv;
      systemName = "cl-org-mode";
      
      sourceProject = "${lisp-project_cl-org-mode}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_closer-mop}";
      name = "lisp_cl-org-mode-20101207-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
