
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-beanstalk, 
   lisp_flexi-streams, lisp_usocket,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_usocket  ];
      inherit stdenv;
      systemName = "cl-beanstalk";
      
      sourceProject = "${lisp-project_cl-beanstalk}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_usocket}";
      name = "lisp_cl-beanstalk-20110619-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
