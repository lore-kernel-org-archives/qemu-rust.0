Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tiFqU-0000o1-Ur
	for mharc-qemu-rust@gnu.org; Wed, 12 Feb 2025 11:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiFqI-0000m8-4A
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 11:44:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiFqF-0003fb-9h
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 11:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739378642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NRmjn2FCKV42r37TgWqir+Va45tyQCRuwDW1ld0IbCM=;
 b=A/rrxrQX0EyeZUUpWtsJO/+mQp+CgH/ldjalVxBwNqyGAFvqRFTZUdnbepwE1NFTHWb7Ov
 tWkI9S5UModwKiXu+C/WwluVPmgA1A3KIWDSW5xinAMReT4ivnem8c36b4QUyDiclB9Rfh
 frm5lEo6eLv96j6J3/Gp/n6Qq+Kuqlg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-xDPyj1UdOVulQtp1HTuCZg-1; Wed, 12 Feb 2025 11:44:01 -0500
X-MC-Unique: xDPyj1UdOVulQtp1HTuCZg-1
X-Mimecast-MFC-AGG-ID: xDPyj1UdOVulQtp1HTuCZg
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4392fc6bd21so21098825e9.1
 for <qemu-rust@nongnu.org>; Wed, 12 Feb 2025 08:44:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739378640; x=1739983440;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NRmjn2FCKV42r37TgWqir+Va45tyQCRuwDW1ld0IbCM=;
 b=poM+P1+iNCd0gZFcN4dTGJbRYbvdxNJZL69VVcbwi5sqelnalS0hcMCJz5PxcASEbR
 yGO6nMA2C5KinU7BpIBTqCRZWCzeddwbyv2ImMzvjBHAhXiy6ilWO4MD5rdra5M1GZeA
 GqK6Ga/9JjwMB0NRM1cJdywanm9gTLCbwiYg5LxfG/RBY2caVJQURV7nSG2hcw1vWys+
 o36pCP0FVOlOXkR/mEP4UkfUH6yLs1er9bfGqYiP8LZH1RjcmOMt9DcCpNMksZLs9FvJ
 3zfMgQv6F8L9tNCahPaZc55iXld8DwcvGPnVzwEJ5d7s1cXIY3TvAbvdLhHN6KEx38D8
 WI3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBS5tPp1ziTdvMuhNR3tcvGsXhq0mfl5IjfvpjRYGlFbozRINlKQlaTzKErxeEZf1Fx7lVQAOjDtA=@nongnu.org
X-Gm-Message-State: AOJu0YzS2OtEq8EmVusRx+dbDHpH0JEbaB7ro2bEI2rnFoEHuBV+ezl1
 +Y+2ZNtxmVKp/Rcx1/2Mvxl+Yn3zC9BRYP8ybYchVXRcTUDJiz5j7Bv92rJxvciFk+1Lkdy1sRe
 ISWv6qVBcAmKi8QqmHPCuqebWw/vUl+mgIGeITrlFruoZ6feOixo=
X-Gm-Gg: ASbGncsAtKhRmL9lqnR/T8u9Mi0zfZmWp3ewwpEfXaDY7he5GBJDhBWBtSPbM8+sVrb
 7g3QnT4ngizce6yk5Fabu9ju7a8CLAH7+2Bm1GAQC3lM21m1gb1hyZ5BVxCZDw41/2gxrYkcyww
 rIJG9DJ2LxpVuFiLhdMS34y/5IpuQFeGLLP4lMLBUz8YvwrQeW74/2i8BfuIL61gIwA0THkeBBo
 4cyl2FeUSM8RvvfK7dpOAO6FE2Wp6JOpOTMzEA0Y6j2etb9j9V7+pyrVKe97fEXeKNTdXvEaFOK
 p9Q+JPI=
X-Received: by 2002:a05:600c:46c7:b0:439:4355:2f69 with SMTP id
 5b1f17b1804b1-43958165de9mr41498635e9.6.1739378639829; 
 Wed, 12 Feb 2025 08:43:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEm8DfPw7I0LAx3eBg0O30SOOQtYclyV90UafzfoAxKP9+SliopXie+ACGrBEllx/IySHS4HQ==
X-Received: by 2002:a05:600c:46c7:b0:439:4355:2f69 with SMTP id
 5b1f17b1804b1-43958165de9mr41498485e9.6.1739378639460; 
 Wed, 12 Feb 2025 08:43:59 -0800 (PST)
Received: from [192.168.10.81] ([151.95.148.6])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38dc4d00645sm16862976f8f.66.2025.02.12.08.43.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 08:43:58 -0800 (PST)
Message-ID: <7fe0ba58-8d91-49c7-8f93-d17f42c74fbc@redhat.com>
Date: Wed, 12 Feb 2025 17:43:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] rust/block: Add driver module
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, manos.pitsidianakis@linaro.org, qemu-devel@nongnu.org, 
 qemu-rust@nongnu.org
References: <20250211214328.640374-1-kwolf@redhat.com>
 <20250211214328.640374-9-kwolf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250211214328.640374-9-kwolf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r8QTJOo6re5Gw7Y-L0UMVTG9mgT9TthJbytlWXXW_Vc_1739378640
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Wed, 12 Feb 2025 16:44:09 -0000

On 2/11/25 22:43, Kevin Wolf wrote:
> +    /// Reads data from the child node into a linear typed buffer.
> +    pub async fn read<T: IoBuffer + ?Sized>(&self, offset: u64, buf: &mut T) -> io::Result<()> {
> +        unsafe {
> +            self.read_raw(offset, buf.buffer_len(), buf.buffer_mut_ptr())
> +                .await
> +        }
> +    }
> +
> +    /// Reads data from the child node into a linear, potentially uninitialised typed buffer.
> +    pub async fn read_uninit<T: SizedIoBuffer>(
> +        &self,
> +        offset: u64,
> +        mut buf: MaybeUninit<T>,

I think Rust doesn't guarantee no copies here, so maybe this could be

    pub async fn read_uninit<T: SizedIoBuffer>(
        &self,
        offset: u64,
        buf: &mut MaybeUninit<T>,
     ) -> io::Result<&mut T>

using assume_init_mut().

Paolo


