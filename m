Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tNoYn-0005xx-0S
	for mharc-qemu-rust@gnu.org; Wed, 18 Dec 2024 02:33:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tNoYa-0005wk-EJ
 for qemu-rust@nongnu.org; Wed, 18 Dec 2024 02:33:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tNoYX-0002xd-GR
 for qemu-rust@nongnu.org; Wed, 18 Dec 2024 02:33:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734507195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ADIowwNWyQ2GKFEmqJDfWnWcP/SykytSgyeLV3hG0vI=;
 b=E/39ZnR6qIdqpNTwDLOrfmOhRux5HUAMV89ANfLJZbRkV9iECwWHv7E175y/MJyPj8yR05
 I82s0XXyVoBVdDwFn7Te3csHGjhHcG22cVX4LGgAJX+ai7f6TXHnnFsWcCsfo0ypeZ/hDb
 hur06My4VGVn4v/14S0xogNtUDy7bV4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-fRmrUsUePOWTb5fKO2ammw-1; Wed, 18 Dec 2024 02:33:12 -0500
X-MC-Unique: fRmrUsUePOWTb5fKO2ammw-1
X-Mimecast-MFC-AGG-ID: fRmrUsUePOWTb5fKO2ammw
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3878ad4bf8cso3897507f8f.1
 for <qemu-rust@nongnu.org>; Tue, 17 Dec 2024 23:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734507191; x=1735111991;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ADIowwNWyQ2GKFEmqJDfWnWcP/SykytSgyeLV3hG0vI=;
 b=m/Xz4Ts71sekDE3ZtRAENOox6jk71OdK5Rod4+4QTg83jnljeLYnABWf4EzfMcmaNU
 JdS8qtcCpCIKdVbYGUNcHdbB8da37HAPwoBcnAXNV6R6uQ5ac9pv3H0v6f76JVpKZumn
 6W1y3WVfVqWa4Dyzv4pFtXTIJccyFlKBErjOicaMfEY5gkh1MknnRo02BpwTvFcCiRWM
 sc0WVdwq4fKfXG2q7duentEO8PQ3ARD34vVoUpilxgj0fFHeq4d8gFdph3vNjGfuWsb1
 YjjYcDInN6NYrKh5T1aFsikPFe5Xslg+a6nYgqq9BwT+7x8K4XdEwjT7/auDBhVOltzM
 sPYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzb5fgiP5ha0UtnDMBFWCNGdteoo2I9+zFH1jgeyHS4q5fcKw+mLuoQbHciyl5urH8zoHBhLrqxRs=@nongnu.org
X-Gm-Message-State: AOJu0Ywxp2iOrhlWweO2MjttGaSuMZwL1Id8s+khulyW2T90Eg5ibuAo
 jXHagnVZVzkyHKu1AsalD24qTMco40N1x1ZsGzzgNacC/augZRXjDa3RRi1Nm6qSUJzRx6qDE3d
 fc2WiK5HSZrYuKC72QeQZ14gqIR5dZbjFp0AmlFrz5ZzEzTauWbbtphYkKDdE9ypUGLvysmdST+
 ojOekfz0cKislWLAPqz5UGPBdvcg==
X-Gm-Gg: ASbGnctImcpbVNDShcVKgH92OEtnAKJWLsDmHuGPvz+CxNJFvZOF+AzSm18sJFTTA6W
 rT/GUS8IAJMeBU4LhDCvZQ+khHeYZu9u2VOTE
X-Received: by 2002:a05:6000:4b0a:b0:385:fb56:5596 with SMTP id
 ffacd0b85a97d-388e4d444damr1328235f8f.19.1734507191430; 
 Tue, 17 Dec 2024 23:33:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfF/T7xstYRU7sAKQS4uQhrPSmPeSQWFaBB5Qa6WSQqLQzPid22HHUT7IqvkObELJ9nPgxesN8jlLH0PddZfg=
X-Received: by 2002:a05:6000:4b0a:b0:385:fb56:5596 with SMTP id
 ffacd0b85a97d-388e4d444damr1328213f8f.19.1734507191023; Tue, 17 Dec 2024
 23:33:11 -0800 (PST)
MIME-Version: 1.0
References: <20241209123717.99077-1-pbonzini@redhat.com>
 <20241209123717.99077-27-pbonzini@redhat.com>
 <Z2GjLOppRcHFBpAT@intel.com>
 <CABgObfYE8z5QeVSWT7odaPcZYNfW0Ox1gNmGyCvj0YRTsDEGrg@mail.gmail.com>
 <Z2J1EI+R51GqPhVA@intel.com>
In-Reply-To: <Z2J1EI+R51GqPhVA@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 18 Dec 2024 08:32:59 +0100
Message-ID: <CABgObfZJNC2EWsYYSZfTYF8mebRzAmiYwD=d6bdG=10oQ3tQBg@mail.gmail.com>
Subject: Re: [PATCH 26/26] rust: callbacks: allow passing optional callbacks
 as ()
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org, 
 Junjie Mao <junjie.mao@hotmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NiqQF2zy9kSW7beYwQPcz7xJU6EMzhgPS5SB7rPUkX8_1734507191
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000fb5a9f0629866cb9"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.116,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Wed, 18 Dec 2024 07:33:31 -0000

--000000000000fb5a9f0629866cb9
Content-Type: text/plain; charset="UTF-8"

Il mer 18 dic 2024, 07:50 Zhao Liu <zhao1.liu@intel.com> ha scritto:

> Am I using the wrong terminology? Function pointers in a structure should
> be called a vtable, rather than callbacks (for example, methods in
> TypeInfo,
> read/write methods in MemoryRegionOps). Callbacks are typically function
> pointers used as function parameters (for example, timer/gpio). So, is the
> callback implementation here only used for the latter case?
>

The callback implementation is not used for QOM indeed. In that case, using
FnCall would require something like

const UNPARENT: impl FnCall((&Self,));

which does not exist as far as I know?

MemoryRegionOps is a mix of callbacks and a vtable.  From the Rust point of
view, with the API that uses the builder pattern, MemoryRegionOps (and
VMStateDescription too) would be closer to callbacks. Instead when you use
traits and fill in the class object, that's clearly a vtable.

But in this sense MemoryRegionOps do not need optional callbacks. You just
don't call the ops.read() method if you don't need to set a read callback
for example. So I am not sure if anything that is planned right now needs
the optional callbacks. It's good to have the patch for the future but it's
not necessary right now.

Paolo

--000000000000fb5a9f0629866cb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 18 dic 2024, 07:50 Zhao Liu &lt;<a href=3D"mail=
to:zhao1.liu@intel.com" target=3D"_blank" rel=3D"noreferrer">zhao1.liu@inte=
l.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Am I using the wrong terminology? Function pointers in a structu=
re should<br>
be called a vtable, rather than callbacks (for example, methods in TypeInfo=
,<br>
read/write methods in MemoryRegionOps). Callbacks are typically function<br=
>
pointers used as function parameters (for example, timer/gpio). So, is the<=
br>
callback implementation here only used for the latter case?<br></blockquote=
></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">The callback imp=
lementation is not used for QOM indeed. In that case, using FnCall would re=
quire something like</div><div dir=3D"auto"><br></div><div dir=3D"auto">con=
st UNPARENT: impl FnCall((&amp;Self,));</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">which does not exist as far as I know?</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">MemoryRegionOps is a mix of callbacks and a =
vtable.=C2=A0 From the Rust point of view, with the API that uses the build=
er pattern, MemoryRegionOps (and VMStateDescription too) would be closer to=
 callbacks. Instead when you use traits and fill in the class object, that&=
#39;s clearly a vtable.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
But in this sense MemoryRegionOps do not need optional callbacks. You just =
don&#39;t call the ops.read() method if you don&#39;t need to set a read ca=
llback for example. So I am not sure if anything that is planned right now =
needs the optional callbacks. It&#39;s good to have the patch for the futur=
e but it&#39;s not necessary right now.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Paolo</div></div>

--000000000000fb5a9f0629866cb9--


