
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ana, 
   lisp_gsll, lisp_split-sequence, lisp_alexandria,  
  ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_gsll lisp_split-sequence lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-ana.quantity";
      
      sourceProject = "${lisp-project_cl-ana}";
      patches = [];
      lisp_dependencies = "${lisp_gsll} ${lisp_split-sequence} ${lisp_alexandria}";
      name = "lisp_cl-ana-quantity-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" ];
    }
