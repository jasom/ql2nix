
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-acronyms, 
   lisp_split-sequence, lisp_alexandria,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-acronyms";
      
      sourceProject = "${lisp-project_cl-acronyms}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_alexandria}";
      name = "lisp_cl-acronyms-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
