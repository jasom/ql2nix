
{ buildLispPackage, stdenv, fetchurl, lisp-project_de-setf-wilbur, 
   lisp_usocket,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_usocket  ];
      inherit stdenv;
      systemName = "wilbur";
      
      sourceProject = "${lisp-project_de-setf-wilbur}";
      patches = [];
      lisp_dependencies = "${lisp_usocket}";
      name = "lisp_wilbur-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
