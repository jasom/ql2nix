
{ buildLispPackage, stdenv, fetchurl, lisp-project_moira, 
   lisp_osicat, lisp_trivial-features, lisp_serapeum, lisp_alexandria,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_osicat lisp_trivial-features lisp_serapeum lisp_alexandria  ];
      inherit stdenv;
      systemName = "moira";
      
      sourceProject = "${lisp-project_moira}";
      patches = [];
      lisp_dependencies = "${lisp_osicat} ${lisp_trivial-features} ${lisp_serapeum} ${lisp_alexandria}";
      name = "lisp_moira-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
