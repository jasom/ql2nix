
{ buildLispPackage, stdenv, fetchurl, lisp-project_glaw, 
   lisp_imago, lisp_cl-alc, lisp_cl-openal, lisp_cl-opengl,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_imago lisp_cl-alc lisp_cl-openal lisp_cl-opengl  ];
      inherit stdenv;
      systemName = "glaw-imago";
      
      sourceProject = "${lisp-project_glaw}";
      patches = [];
      lisp_dependencies = "${lisp_imago} ${lisp_cl-alc} ${lisp_cl-openal} ${lisp_cl-opengl}";
      name = "lisp_glaw-imago-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
