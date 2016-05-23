﻿using UnityEngine;
using System.Collections;

public class KinectButton : MonoBehaviour {

    public float radius = 1f;

    Vector2 pos;
    Animator animator;

	// Use this for initialization
	void Start () {
        pos = new Vector2(transform.position.x, transform.position.y);
        animator = GetComponent<Animator>();
	}
	
	// Update is called once per frame
	void Update () {

    }

    public float HitTest(Vector2 cursorPos)
    {
        float distance = Vector2.Distance(pos, cursorPos);

        if (distance <= radius)
        {
            return distance;
        }
        else
        {
            return -1f;
        }
    }

    public void OnCursorEnter()
    {
        animator.SetBool("active", true);
    }

    public void OnCursorLeave()
    {
        animator.SetBool("active", false);
    }
}