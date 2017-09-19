
{ buildLispPackage, stdenv, fetchurl, lisp-project_caveman2-widgets-bootstrap, 
   lisp_caveman2-widgets, lisp_caveman2,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_caveman2-widgets lisp_caveman2  ];
      inherit stdenv;
      systemName = "caveman2-widgets-bootstrap";
      
      sourceProject = "${lisp-project_caveman2-widgets-bootstrap}";
      patches = [];
      lisp_dependencies = "${lisp_caveman2-widgets} ${lisp_caveman2}";
      name = "lisp_caveman2-widgets-bootstrap-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
