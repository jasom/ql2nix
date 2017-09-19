
{ buildLispPackage, stdenv, fetchurl, lisp-project_grovel-locally, 
   lisp_cl-ppcre, lisp_with-cached-reader-conditionals, lisp_cffi-grovel, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_with-cached-reader-conditionals lisp_cffi-grovel lisp_cffi  ];
      inherit stdenv;
      systemName = "grovel-locally";
      
      sourceProject = "${lisp-project_grovel-locally}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_with-cached-reader-conditionals} ${lisp_cffi-grovel} ${lisp_cffi}";
      name = "lisp_grovel-locally-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
