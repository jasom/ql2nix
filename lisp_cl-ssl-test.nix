
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ssl, 
   lisp_cl-ssl, lisp_cl-coveralls, lisp_fiveam, lisp_usocket,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ssl lisp_cl-coveralls lisp_fiveam lisp_usocket  ];
      inherit stdenv;
      systemName = "cl+ssl.test";
      
      sourceProject = "${lisp-project_cl-ssl}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ssl} ${lisp_cl-coveralls} ${lisp_fiveam} ${lisp_usocket}";
      name = "lisp_cl-ssl-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
