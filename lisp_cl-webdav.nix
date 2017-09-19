
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-webdav, 
   lisp_cxml, lisp_hunchentoot,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cxml lisp_hunchentoot  ];
      inherit stdenv;
      systemName = "cl-webdav";
      
      sourceProject = "${lisp-project_cl-webdav}";
      patches = [];
      lisp_dependencies = "${lisp_cxml} ${lisp_hunchentoot}";
      name = "lisp_cl-webdav-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
