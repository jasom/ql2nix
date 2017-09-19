
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-blapack, 
   lisp_org-middleangle-foreign-numeric-vector, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_org-middleangle-foreign-numeric-vector lisp_cffi  ];
      inherit stdenv;
      systemName = "org.middleangle.cl-blapack-gen";
      
      sourceProject = "${lisp-project_cl-blapack}";
      patches = [];
      lisp_dependencies = "${lisp_org-middleangle-foreign-numeric-vector} ${lisp_cffi}";
      name = "lisp_org-middleangle-cl-blapack-gen-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
