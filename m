Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uPeFe-00017K-QX
	for mharc-qemu-rust@gnu.org; Thu, 12 Jun 2025 05:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uPeAf-00032a-63
 for qemu-rust@nongnu.org; Thu, 12 Jun 2025 05:24:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uPeAc-0006jL-Bn
 for qemu-rust@nongnu.org; Thu, 12 Jun 2025 05:24:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749720262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4EaVDFQRyFhrvUbX6GFcTmrBkopzxt0kndnCrWdyEUk=;
 b=jHYwlJ3k6e5DLz2N2s0d1+1/YjJJUgMVHP5hNV1DK8pG5SxA0WgCCYqa+PRLw8zQ24rhA/
 4bKweSCREzYpsERgRLTAorZG4ouvGPm7DMg2DFW4/NInOoCQ9/Rpk57Vu1z8NSQ5mGXZA2
 DSInSKR/A8KdqOI3X3amhETEIrdzszo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-U4PDLSbVNZyLp8_3flSgiw-1; Thu, 12 Jun 2025 05:24:21 -0400
X-MC-Unique: U4PDLSbVNZyLp8_3flSgiw-1
X-Mimecast-MFC-AGG-ID: U4PDLSbVNZyLp8_3flSgiw_1749720260
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-451d3f03b74so3831475e9.3
 for <qemu-rust@nongnu.org>; Thu, 12 Jun 2025 02:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749720260; x=1750325060;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4EaVDFQRyFhrvUbX6GFcTmrBkopzxt0kndnCrWdyEUk=;
 b=jUtiE4cgm6fExGAd69UCZD+skrmgzeO8WS92AMrQsIWNcuvahe3evFkTcarQEJQ65d
 lgXWZ4FqALMvPnKjuClKSqsWfQuNBL0iQVv+JRlZhH6Gs8aNrF/6N2qiVxRuHafJg1j7
 08acBmBer5bT5sboax8AEXxzYPgcesAvKll5cgyd6k1EbMxkicrkgzQZMFP582t2lelV
 D4m4eLOteaBZFDN88V7FIAbVgpdYiylja11uatFg5dkHINS/6RpyguiBcnU3+5elFtwG
 6pSJL8wG1+NiHW9P7vdaPyGTL0u7oTC8eW9N7Nz269y/G71Vj+Y7gg4g/DdZi2hMWio0
 JRhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdcYwl33SL/Xl3+8M25sMfTsNLbpBlgPJURojQPTSruWSX0J+2gqimHYF5UKMCDEEPktrJNUpzpDc=@nongnu.org
X-Gm-Message-State: AOJu0YxFGsr082XYprszydDB3cRE52uXEp1bTILUSGq20KgE+uMpmmva
 zGkx74Mw+vyHwX4n58hfudpF0xDzVxmwqJZ1ttdAITHDTRJyGRGQA3iahS2KkFbenaF0wmkhz3O
 iBza8NPSY3sbw7rXIRSeox6AL6k56l+clnxPVBojN2ySp7lBHcbWFP628WtgtDdsAAPO7jqmH8I
 9FuqUYIErm/J2rnfCEZGmeN8F70v0FuA==
X-Gm-Gg: ASbGncv4TdkWkyU5g+nlRy4bBdbVwyv0zLHvuOlcB03aDcsqEP7+zJNnemBy9ysTCNw
 YyZLHSYfvOpa0MSrSnABA2n9ozYmifYxWtkl/RBwNuZha+u4nrfby9mTT5SAjjrF+M8+D35ozeA
 wUcd8=
X-Received: by 2002:a05:600c:a105:b0:442:e9eb:cb9e with SMTP id
 5b1f17b1804b1-453248ca563mr41291325e9.26.1749720260148; 
 Thu, 12 Jun 2025 02:24:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsi+ghfKbHvwKS6frnq48KsB0a+dyRT63N7gr3cGBDuVtHuDrC7Ht5xKdTwfCfsaNsNt9od26XYs2BBGGaTNQ=
X-Received: by 2002:a05:600c:a105:b0:442:e9eb:cb9e with SMTP id
 5b1f17b1804b1-453248ca563mr41291195e9.26.1749720259856; Thu, 12 Jun 2025
 02:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250609154423.706056-1-pbonzini@redhat.com>
 <20250609154423.706056-5-pbonzini@redhat.com>
 <aEqcGiGmZiMoIhY5@intel.com>
 <CABgObfb8CWy5zthqHRJrKqjP4xmBC=Zh3FrDjcK2Z6wsZJu-ew@mail.gmail.com>
 <aEqg5j9LFgszQzAv@intel.com>
In-Reply-To: <aEqg5j9LFgszQzAv@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 12 Jun 2025 11:24:05 +0200
X-Gm-Features: AX0GCFu0JGsIvZatRLCpgDOa2tn-ZgT4FfAm4yXQorvDkrs183gfNujoXhCL_aw
Message-ID: <CABgObfYJx8SQjqi8-wnm_MJPuUEzfW7gsA2bdmpTSV4kCB7Yqg@mail.gmail.com>
Subject: Re: [PATCH 4/5] rust: qom: make ParentInit lifetime-invariant
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XkM6gTnPe9gqEUECupXOZtBoqTUfLMEVbckHgAQPBKE_1749720260
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 12 Jun 2025 09:24:30 -0000

On Thu, Jun 12, 2025 at 11:20=E2=80=AFAM Zhao Liu <zhao1.liu@intel.com> wro=
te:
> > Right, I put it there because '2 lives until the second println!. The
> > problem is not so much that it's returning token1, it's that the
> > println uses it.
>
> Even after I comment out the last intln line, the compiler still
> complains about returning token1. It seems the compiler's checking is
> stricter.

Oh, you're right. Anything that the closure returns must have a longer
lifetime than the closure itself!

Paolo


