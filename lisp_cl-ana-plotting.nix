
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ana, 
   lisp_closer-mop, lisp_external-program, lisp_gsll, lisp_split-sequence, lisp_alexandria,  
  ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_external-program lisp_gsll lisp_split-sequence lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-ana.plotting";
      
      sourceProject = "${lisp-project_cl-ana}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_external-program} ${lisp_gsll} ${lisp_split-sequence} ${lisp_alexandria}";
      name = "lisp_cl-ana-plotting-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" ];
    }