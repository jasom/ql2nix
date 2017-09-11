
{ buildLispPackage, stdenv, fetchurl, lisp-project_com-clearly-useful-iterator-protocol, 
   lisp_com-clearly-useful-generic-collection-interface, lisp_com-clearly-useful-protocols,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_com-clearly-useful-generic-collection-interface lisp_com-clearly-useful-protocols  ];
      inherit stdenv;
      systemName = "com.clearly-useful.iterator-protocol";
      
      sourceProject = "${lisp-project_com-clearly-useful-iterator-protocol}";
      patches = [];
      lisp_dependencies = "${lisp_com-clearly-useful-generic-collection-interface} ${lisp_com-clearly-useful-protocols}";
      name = "lisp_com-clearly-useful-iterator-protocol-20130312-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
