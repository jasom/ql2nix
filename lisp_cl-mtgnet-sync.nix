
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mtgnet, 
   lisp_cl-mtgnet, lisp_usocket,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-mtgnet lisp_usocket  ];
      inherit stdenv;
      systemName = "cl-mtgnet-sync";
      
      sourceProject = "${lisp-project_cl-mtgnet}";
      patches = [];
      lisp_dependencies = "${lisp_cl-mtgnet} ${lisp_usocket}";
      name = "lisp_cl-mtgnet-sync-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
