Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1u53hK-0001ID-NU
	for mharc-qemu-rust@gnu.org; Wed, 16 Apr 2025 10:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u53gp-0001Fl-QY
 for qemu-rust@nongnu.org; Wed, 16 Apr 2025 10:24:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u53gn-0004tU-Je
 for qemu-rust@nongnu.org; Wed, 16 Apr 2025 10:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744813470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q8CbI7YFNj21yDqmjb88k0lLSJFd82KWDmHzO/GZVF4=;
 b=ZuSGQpw0jdbpUoX3ygnM+NsX8TySXj1tvxnM+fGtqLtNXHlg+EmfbCuQu7YhNbT0klgs5J
 6oulVw6jkNwM4sNYI8dwYW6yhfE8DknuEa9regvhhr2iAknzh0werk75837NcZAJATUJEw
 K4oWS9NU8BdShGt8DzJpfs4SGVqRKpM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-LFAO89r6OK6f3AwkvBrvTQ-1; Wed, 16 Apr 2025 10:24:21 -0400
X-MC-Unique: LFAO89r6OK6f3AwkvBrvTQ-1
X-Mimecast-MFC-AGG-ID: LFAO89r6OK6f3AwkvBrvTQ_1744813460
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43cfda30a3cso38834735e9.3
 for <qemu-rust@nongnu.org>; Wed, 16 Apr 2025 07:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744813460; x=1745418260;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q8CbI7YFNj21yDqmjb88k0lLSJFd82KWDmHzO/GZVF4=;
 b=PysRYDfUYecf1obHcpptcNr1KMG7iNkmIP/w9vTnwC/F5dKzfeReX4CjdaxrFriktf
 snG5D8xA16pjG6YO5xH4N9616I+vbK9osS/HEh9vepg8bApodKUjbb20LLnhoUWucQky
 Ff3LncRwvS/T0V1OHgr1RMJ0SzHgrlOtMYf+3pSsuzBZk39rPKjtJywsTROMRWQ8A2l/
 93BNjC5EJzbf7XvZl1Ax5Dy5HWh38fbxwpgO70z7/UwK7t319zJDMCEB+M379Enx8BRX
 YxMqOvlDTpPJV3ln25pu+TRKGJel8jRppXvGeM5SWJVknfq5TXzDO4N/mCQ+Kg1cudho
 uGLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI6HTP6tmlTiE4bWcxLqFX3w+wAIvjLBYcCt0aDwvgt5YSHlXhP3S1rM71aoMTOG5hPjrFTLDLFAw=@nongnu.org
X-Gm-Message-State: AOJu0Yzp5kw9yZnAtQg8MUWFNvveofw0mmySy6Y3TAEKbs8N+4zKS2I9
 wmurAZ0X+BPHHX0uDGUtruTBF9Yvza3+7fWFT3T/asLgy82wvRtJ7Rglg/xngKghkGU3Rnecc2x
 lQdIlOI2g2gdVBSgGDXa1xWmbhyDQrJ02T4yWoNX1Lx255eiJlmNMIxVSMR9NGN7M2Ktc7XiVn7
 TaY3vfYCCUm6yRffntvAbwIePqyw==
X-Gm-Gg: ASbGncsJ4nbSaFgS+zRqeqVVPII0yFDiBx42nxbe1yJm63kPPU/TDzvV+1J4dosLBnY
 9V+X8Z1qdi578m6pbK9u5dLvYPoUWua6tvgmt7jzu5/96s7is2GU4UdqJtp+RaSG91sHHRA==
X-Received: by 2002:a05:600c:54c5:b0:43d:10c:2f60 with SMTP id
 5b1f17b1804b1-4405e4b88b4mr16181385e9.24.1744813460209; 
 Wed, 16 Apr 2025 07:24:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPsD4cWB8KvnFFOp1rscTdMjNWmz6MGStVEGdBHPVwrLCl1q2QCFASTHbx6zpjcBODb+Xxe/gL4JnD8IGqpG8=
X-Received: by 2002:a05:600c:54c5:b0:43d:10c:2f60 with SMTP id
 5b1f17b1804b1-4405e4b88b4mr16181135e9.24.1744813459758; Wed, 16 Apr 2025
 07:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250414144943.1112885-1-zhao1.liu@intel.com>
 <20250414144943.1112885-3-zhao1.liu@intel.com>
 <c44eebb9-1252-447e-9262-e2946f90f01c@redhat.com> <Z/97xG5VONqmlK+7@intel.com>
 <Z/+j3be+ZT7G1ToL@intel.com>
In-Reply-To: <Z/+j3be+ZT7G1ToL@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 16 Apr 2025 16:24:07 +0200
X-Gm-Features: ATxdqUGRX_V_bfTsFItme8CeZJ8Ner1vUlayCbnxr1bv4fc03jO9yQpKnBPeGJs
Message-ID: <CABgObfZVh1nAjFd8m4hO8_dfW87cAjYgBC9_3Mve5pXWf=n-mw@mail.gmail.com>
Subject: Re: [PATCH 2/9] rust/vmstate: Support varray's num field wrapped in
 BqlCell
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org, 
 Dapeng Mi <dapeng1.mi@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BtNh-Q21B0yJlMiItAWUm5B_4JpLSkjZrc3yHCYckws_1744813460
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000077f35f0632e60a4d"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Apr 2025 14:24:37 -0000

--00000000000077f35f0632e60a4d
Content-Type: text/plain; charset="UTF-8"

Il mer 16 apr 2025, 14:14 Zhao Liu <zhao1.liu@intel.com> ha scritto:

> >                 let access = v.$i$($crate::if_present!([$num]: [v.$num -
> 1])])?;
>
> So, the correct code should just check array[0] as you said:
>
> let access = v.$i$($crate::if_present!([$num]: [0])])?;
>

Except I think the if_present! call would not be in assert_field_type; it
would be in the caller, i.e. vmstate.rs.

Paolo

Based on this, there's no need for anything else such as `Into`.
>
> >                 types_must_be_equal::<_, $ti>(access);
> >             }
> >         };
> >     };
> > }
>
> Thanks,
> Zhao
>
>

--00000000000077f35f0632e60a4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il mer 16 apr 2025, 14:14 Zhao L=
iu &lt;<a href=3D"mailto:zhao1.liu@intel.com">zhao1.liu@intel.com</a>&gt; h=
a scritto:</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0let acces=
s =3D v.$i$($crate::if_present!([$num]: [v.$num - 1])])?;<br>
<br>
So, the correct code should just check array[0] as you said:<br>
<br>
let access =3D v.$i$($crate::if_present!([$num]: [0])])?;<br></blockquote><=
/div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Except I think the=
 if_present! call would not be in assert_field_type; it would be in the cal=
ler, i.e. <a href=3D"http://vmstate.rs">vmstate.rs</a>.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Paolo=C2=A0</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
Based on this, there&#39;s no need for anything else such as `Into`.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0types_mus=
t_be_equal::&lt;_, $ti&gt;(access);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0 =C2=A0};<br>
&gt; }<br>
<br>
Thanks,<br>
Zhao<br>
<br>
</blockquote></div></div></div>

--00000000000077f35f0632e60a4d--


