Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tNChV-0007Sm-2N
	for mharc-qemu-rust@gnu.org; Mon, 16 Dec 2024 10:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tNChT-0007SU-Ma
 for qemu-rust@nongnu.org; Mon, 16 Dec 2024 10:07:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tNChS-00077b-73
 for qemu-rust@nongnu.org; Mon, 16 Dec 2024 10:07:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734361676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zPP/G/B52pycc696Wd9izs585ZKMXBRk/dY5TcvCWoc=;
 b=Pa9se7dFFyl3hMADPCSdWQIqK4bCFtAcMyk/tN3G7hB0CNs44O9nsvZfGjxOSH0Q1xjMwq
 yyI9kiO5m8BkuPayC//kBYS7qX174ReNXIrB6WSzDoVI3PVI4kwYvzi/M4R/da3s+82MZ7
 va8G7WR/iJupTFsnvobiCvDQU2M0+G4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-kwE_o_8SPtKO0eYc8xJ4Tw-1; Mon, 16 Dec 2024 10:07:53 -0500
X-MC-Unique: kwE_o_8SPtKO0eYc8xJ4Tw-1
X-Mimecast-MFC-AGG-ID: kwE_o_8SPtKO0eYc8xJ4Tw
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4362153dcd6so6731045e9.2
 for <qemu-rust@nongnu.org>; Mon, 16 Dec 2024 07:07:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734361671; x=1734966471;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zPP/G/B52pycc696Wd9izs585ZKMXBRk/dY5TcvCWoc=;
 b=niwVi6Jyoj2bA6DBsfJqq+ODSUWbSLyiy+UQdwSIzGugKMMSBJxyQMg4OCpt6s8fqp
 /fip92nj1N8ll4b5isJt/ffzrW24LRqepT6stP4iX2NqtZ06FEZn1Q8yph8H9C/C/bZe
 oSA6ljC5JCIaSt/DTTTNU18PAl/JxeBeGmVXcWbh4LIm+LRZpsvlkaNp9LB2t9QyWrjU
 NRifxR2KmHMIjDZML18rnHs47sxAGNXjSvpN57U4qrlGTQwe8DmlpTCG1EINCzKqKgL8
 pCtuRC1Ic6CdJQX+YRlpSe42drZeG9thi/3j3QLrZpDx4pmprTWe6pG9aMaiW6soPE1G
 mQhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUytqssAZbL7IdTydCmxAY5zTQrzTdRu1LMTa+eN2YJt/cLJMIItDZjDEiPzMy8+PljdQYGuKZo0ag=@nongnu.org
X-Gm-Message-State: AOJu0YyMxjCF8BLS20oMvOd8YZZIKPaCCUaAlI5qlgqPuB0YER4ygLn6
 doFX1eloWM+aakITeJ01SlbKSUtWScJUkDR89M/CTdEaEtcqFij7ZQP8EwzjAIGeQLEkPt1UZqp
 Vj9HtYn5oZaQV2cjikCTij/wb5VhNuaxmxso/uIPastZRYWSW7Cm4n1W9MU0l1dm/9jPa0eRgfq
 7VW+b7ucbbqWJQw6Um16VuPlCklYu2JJGxgA==
X-Gm-Gg: ASbGncv5GE8dmlwSZUm2X3InFCfubzXGJ+EKzAv37VuFaJpeXV39nBsusl+WaTY/KQV
 wMzPoPQRgnldlnQg+xpBhAykc4FK6tEIe3NEncA==
X-Received: by 2002:a5d:5988:0:b0:382:450c:2607 with SMTP id
 ffacd0b85a97d-38880abfca5mr8646806f8f.4.1734361671195; 
 Mon, 16 Dec 2024 07:07:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoaKbJWOAzDL1Xz3QbLw/pBkLxCGXIF/BsduZlCPsFFtF0QR/ICF7EITGHwaMpZ3lqgivrVgzQPg2tYepc7R8=
X-Received: by 2002:a5d:5988:0:b0:382:450c:2607 with SMTP id
 ffacd0b85a97d-38880abfca5mr8646772f8f.4.1734361670851; Mon, 16 Dec 2024
 07:07:50 -0800 (PST)
MIME-Version: 1.0
References: <20241209123717.99077-1-pbonzini@redhat.com>
 <20241209123717.99077-22-pbonzini@redhat.com>
 <Z1q1KAShyW44BJCg@intel.com>
In-Reply-To: <Z1q1KAShyW44BJCg@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Dec 2024 16:07:38 +0100
Message-ID: <CABgObfa6opCJquJEbyZB6h+Cmk_WcDcJ=w_zvY7D=bwRWV5-uw@mail.gmail.com>
Subject: Re: [PATCH 21/26] rust: tests: allow writing more than one test
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, 
 Junjie Mao <junjie.mao@hotmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Nr--HO4eFufKTZK6XsgZ2dfGX2L_rYMyf1U_5DriNkI_1734361673
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.13,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 16 Dec 2024 15:07:59 -0000

On Thu, Dec 12, 2024 at 10:46=E2=80=AFAM Zhao Liu <zhao1.liu@intel.com> wro=
te:
>
> > +fn init_qom() {
> > +    static ONCE: Mutex<Cell<bool>> =3D Mutex::new(Cell::new(false));
> > +
> > +    let g =3D ONCE.lock().unwrap();
> > +    if !g.get() {
> > +        unsafe {
> > +            module_call_init(module_init_type::MODULE_INIT_QOM);
> > +        }
> > +        g.set(true);
> > +    }
> > +}
>
> Only one question: what is the purpose of using a Mutex here?

Different #[test] functions can be run in parallel. For now there is
nothing that needs the BQL in the tests, so I used an independent
Mutex (which could become a LazyLock later when the minimum supported
Rust version is bumped).

It could also use unsafe { bql_lock(); } and a BqlCell. I left that
for when there will be a way to lock the BQL from safe Rust code, but
I can also do that now already.

Paolo


