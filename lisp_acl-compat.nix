
{ buildLispPackage, stdenv, fetchurl, lisp-project_portableaserve, 
   lisp_cl-fad, lisp_cl-ppcre, lisp_ironclad, lisp_puri,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_cl-ppcre lisp_ironclad lisp_puri  ];
      inherit stdenv;
      systemName = "acl-compat";
      
      sourceProject = "${lisp-project_portableaserve}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_cl-ppcre} ${lisp_ironclad} ${lisp_puri}";
      name = "lisp_acl-compat-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
