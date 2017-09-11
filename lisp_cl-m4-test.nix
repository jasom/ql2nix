
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-m4, 
   lisp_cl-heredoc, lisp_cl-m4, lisp_hu-dwim-stefil,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-heredoc lisp_cl-m4 lisp_hu-dwim-stefil  ];
      inherit stdenv;
      systemName = "cl-m4-test";
      
      sourceProject = "${lisp-project_cl-m4}";
      patches = [];
      lisp_dependencies = "${lisp_cl-heredoc} ${lisp_cl-m4} ${lisp_hu-dwim-stefil}";
      name = "lisp_cl-m4-test-20130312-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
