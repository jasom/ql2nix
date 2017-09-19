
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-org-mode, 
   lisp_closer-mop, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-org-mode";
      
      sourceProject = "${lisp-project_cl-org-mode}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_alexandria}";
      name = "lisp_cl-org-mode-20101207-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
