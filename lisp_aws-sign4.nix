
{ buildLispPackage, stdenv, fetchurl, lisp-project_aws-sign4, 
   lisp_secret-values, lisp_flexi-streams, lisp_split-sequence, lisp_ironclad, lisp_local-time,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_secret-values lisp_flexi-streams lisp_split-sequence lisp_ironclad lisp_local-time  ];
      inherit stdenv;
      systemName = "aws-sign4";
      
      sourceProject = "${lisp-project_aws-sign4}";
      patches = [];
      lisp_dependencies = "${lisp_secret-values} ${lisp_flexi-streams} ${lisp_split-sequence} ${lisp_ironclad} ${lisp_local-time}";
      name = "lisp_aws-sign4-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
